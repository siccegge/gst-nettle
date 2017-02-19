TestCase subclass: NettleAesTest [
	testAesInit [
		| ctx_en ctx_de |

		self should: [
			ctx_en := NettleAesCtx new.
			NettleAes aes_set_encrypt_key: ctx_en length: 16 key: 'ABCDABCDABCDABCDABCD'.

			ctx_de := NettleAesCtx new.
			NettleAes aes_set_decrypt_key: ctx_de length: 16 key: 'ABCDABCDABCDABCDABCD'.

			true.
		]
	]

	testAesEncryptDecrypt [
		| ctx |

		ctx := NettleAesCtx new.
		NettleAes aes_set_encrypt_key: ctx length: 16 key: 'ABCDABCDABCDABCDABCD'.

		self should: [
			| ciphertext cleartext |
			ciphertext := ''.
			cleartext :=  'aaaaaaaabbbbbbbb'.

			NettleAes aes_encrypt: ctx length: 16 dst: ciphertext src: cleartext.
			NettleAes aes_invert_key: ctx src: ctx.
			NettleAes aes_decrypt: ctx length: 16 dst: cleartext src: ciphertext.

			('aaaaaaaabbbbbbbb' = cleartext)
		]
	]
]