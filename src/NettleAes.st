DLD addLibrary: 'libnettle.so.4'.

CStruct subclass: NettleAesCtx [
	<declaration: #(
		(#keys (#array #uInt 60))
		(#nrounds #uLong)
	)>
]

Object subclass: NettleAes [
	<category: 'Nettle-C AES interface'>

	NettleAes class >> aes_set_encrypt_key: ctx length: length key: key [
		<cCall: 'nettle_aes_set_encrypt_key'
				returning: #void
				args: #(#cObject #int #string)>
	]

	NettleAes class >> aes_set_decrypt_key: ctx length: length key: key [
		<cCall: 'nettle_aes_set_decrypt_key'
				returning: #void
				args: #(#cObject #int #string)>
	]

	NettleAes class >> aes_invert_key: ctx src: src [
		<cCall: 'nettle_aes_invert_key'
				returning: #void
				args: #(#cObject #cObject)>
	]

	NettleAes class >> aes_encrypt: ctx length: length dst: dst src: src [
		<cCall: 'nettle_aes_encrypt'
				returning: #void
				args: #(#cObject #int #stringOut #string)>
	]

	NettleAes class >> aes_decrypt: ctx length: length dst: dst src: src [
		<cCall: 'nettle_aes_decrypt'
				returning: #void
				args: #(#cObject #int #stringOut #string)>
	]
]
