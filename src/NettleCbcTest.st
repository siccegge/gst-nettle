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


			ciphertext printNl.
		]
	]
]