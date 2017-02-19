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

	testAesEncrypt [
		| ctx |

		ctx := NettleAesCtx new.
		NettleAes aes_set_encrypt_key: ctx length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

		self should: [
			| ciphertext cleartext |
			ciphertext := 'aaaaaaaaaaaaaaaa' asByteArray.
			cleartext :=  'aaaaaaaabbbbbbbb' asByteArray.

			NettleAes aes_encrypt: ctx length: 16 dst: ciphertext src: cleartext.
			NettleAes aes_invert_key: ctx src: ctx.

			ciphertext = #[16 5 42 86 30 91 206 232 105 155 194 50 56 82 65 252]
		]
	]

	testAesDecrypt [
		| ctx |
		ctx := NettleAesCtx new.
		NettleAes aes_set_decrypt_key: ctx length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

		self should: [
			| ciphertext cleartext |
			ciphertext := #[16 5 42 86 30 91 206 232 105 155 194 50 56 82 65 252].
			cleartext :=  'zzzzzzzzzzzzzzzz' asByteArray.

			NettleAes aes_decrypt: ctx length: 16 dst: cleartext src: ciphertext.

			'aaaaaaaabbbbbbbb' asByteArray = cleartext
		]
	]
]