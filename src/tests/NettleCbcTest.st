TestCase subclass: NettleCbcTest [
	testEncrypt [
		| ctx |

		ctx := NettleAesCtx new.
		NettleAes aes_set_encrypt_key: ctx length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

		self should: [
			| ciphertext |
			ciphertext := '________________----------------' asByteArray.

			NettleCbc cbc_encrypt: ctx
					  func: (CCallbackDescriptor
							   for: [ :ctx :length :dst :src | NettleAes aes_encrypt: ctx length: length dst: dst src: src ]
							   returning: #void
							   withArgs: #(#cObject #int #cObject #string))
					  blocksize: 16
					  iv: #[3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3]
					  length: 32
					  dst: ciphertext
					  src:  #[97 97 97 97 97 97 97 97 98 98 98 98 98 98 98 98 99 99 99 99 99 99 99 99 100 100 100 100 100 100 100 100].

			ciphertext = #[111 210 65 185 81 80 57 84 238 54 184 29 55 104 107 63 112 167 165 175 245 189 211 42 71 110 242 50 40 28 120 147]
		]
	]

	testDecrypt [
		| ctx |

		ctx := NettleAesCtx new.
		NettleAes aes_set_decrypt_key: ctx length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

		self should: [
			| cleartext |
			cleartext := '________________----------------' asByteArray.

			NettleCbc cbc_decrypt: ctx
					  func: (CCallbackDescriptor
							   for: [ :ctx :length :dst :src | NettleAes aes_decrypt: ctx length: length dst: dst src: src ]
							   returning: #void
							   withArgs: #(#cObject #int #cObject #string))
					  blocksize: 16
					  iv: #[3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3]
					  length: 32
					  dst: cleartext
					  src: #[111 210 65 185 81 80 57 84 238 54 184 29 55 104 107 63 112 167 165 175 245 189 211 42 71 110 242 50 40 28 120 147].

			cleartext = #[97 97 97 97 97 97 97 97 98 98 98 98 98 98 98 98 99 99 99 99 99 99 99 99 100 100 100 100 100 100 100 100]
		]
	]
]