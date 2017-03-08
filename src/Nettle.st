Object subclass: Base64Encoder [

]

Object subclass: Base64Decoder [

]

Object subclass: AesEncrypt [
	| ctx iv |

	AesEncrypt class >> new [
		^self basicNew initialize
	]

	initialize [
		ctx := NettleAesCtx new.
	]


	setIV: aIV [
		iv := aIV asByteArray.
	]

	getIV [
		^iv
	]

	setKey: aKey [
		| key |

		key := aKey asByteArray.
		NettleAes aes_set_encrypt_key: ctx length: (key size) key: key.
	]

	encrypt: someData [
		| size result |

		size := someData size.
		result := ByteArray new: size.

		NettleCbc cbc_encrypt: ctx
					  func: (CCallbackDescriptor
							   for: [ :ctx :length :dst :src | NettleAes aes_encrypt: ctx length: length dst: dst src: src ]
							   returning: #void
							   withArgs: #(#cObject #int #cObject #string))
					  blocksize: 16
					  iv: iv
					  length: size
					  dst: result
					  src: someData.

		^result
	]
]

Object subclass: AesDecrypt [
	| ctx iv |

	AesDecrypt class >> new [
		^self basicNew initialize
	]

	initialize [
		ctx := NettleAesCtx new.
		iv := nil.
	]

	setIV: aIV [
		iv := aIV asByteArray.
	]

	getIV [
		^iv
	]

	setKey: aKey [
		| key |

		key := aKey asByteArray.
		NettleAes aes_set_decrypt_key: ctx length: (key size) key: key.
	]

	decrypt: someData [
		| size result |

		size := someData size.
		result := ByteArray new: size.

		NettleCbc cbc_decrypt: ctx
					  func: (CCallbackDescriptor
							   for: [ :ctx :length :dst :src | NettleAes aes_decrypt: ctx length: length dst: dst src: src ]
							   returning: #void
							   withArgs: #(#cObject #int #cObject #string))
					  blocksize: 16
					  iv: iv
					  length: size
					  dst: result
					  src: someData.

		^result
	]
]