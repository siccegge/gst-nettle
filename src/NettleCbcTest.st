TestCase subclass: NettleCbcTest [
	testEncrypt [
		| ctx |

		ctx := NettleAesCtx new.
		NettleAes aes_set_encrypt_key: ctx length: 16 key: 'ABCDABCDABCDABCDABCD'.

		self should: [
			| ciphertext |
			ciphertext := ''.
			
			NettleCbc cbc_encrypt: ctx
			          func: (CCallbackDescriptor
			                   for: [ :ctx :length :dst :src | NettleAes aes_encrypt: ctx length: length dst: dst src: src ]
			                   returning: #void
			                   withArgs: #(#cObject #int #string #string))
                      blocksize: 16
					  iv: #[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
					  length: 32
			          dst: ciphertext
			          src: 'aaaaaaaabbbbbbbbccccccccdddddddd'.

			ciphertext printNl.
			true.
		]
	]
]