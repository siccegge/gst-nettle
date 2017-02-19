TestCase subclass: NettleAesTest [
	testAesInit [
		| ctx_en ctx_de |

		self should: [
			ctx_en := NettleAesCtx new.
			NettleAes aes_set_encrypt_key: ctx_en length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

			ctx_de := NettleAesCtx new.
			NettleAes aes_set_decrypt_key: ctx_de length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

			true.
		]
	]

	testAesEncryptDecrypt [
		| ctx |

		ctx := NettleAesCtx new.
		NettleAes aes_set_encrypt_key: ctx length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

		self should: [
			| ciphertext cleartext |
			ciphertext := 'aaaaaaaaaaaaaaaa' asByteArray.
			cleartext :=  'aaaaaaaabbbbbbbb' asByteArray.

			NettleAes aes_encrypt: ctx length: 16 dst: ciphertext src: cleartext.
			NettleAes aes_invert_key: ctx src: ctx.
			NettleAes aes_decrypt: ctx length: 16 dst: cleartext src: ciphertext.

			'aaaaaaaabbbbbbbb' asByteArray = cleartext
		]
	]
]