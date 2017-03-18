TestCase subclass: NettleTwofishTest [
	testTwofishInit [
		| ctx_en ctx_de |

		self should: [
			ctx_en := NettleTwofishCtx new.
			NettleTwofish twofish_set_key: ctx_en length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

			true.
		]
	]

	testTwofishEncrypt [
		| ctx |

		ctx := NettleTwofishCtx new.
		NettleTwofish twofish_set_key: ctx length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

		self should: [
			| ciphertext cleartext |
			ciphertext := 'aaaaaaaaaaaaaaaa' asByteArray.
			cleartext :=  'aaaaaaaabbbbbbbb' asByteArray.

			NettleTwofish twofish_encrypt: ctx length: 16 dst: ciphertext src: cleartext.

			ciphertext = #[199 114 249 212 137 3 140 18 87 80 147 142 32 29 211 33]
		]
	]

	testTwofishDecrypt [
		| ctx |
		ctx := NettleTwofishCtx new.
		NettleTwofish twofish_set_key: ctx length: 16 key: ('ABCDABCDABCDABCD' asByteArray).

		self should: [
			| ciphertext cleartext |
			ciphertext := #[199 114 249 212 137 3 140 18 87 80 147 142 32 29 211 33].
			cleartext :=  'zzzzzzzzzzzzzzzz' asByteArray.

			NettleTwofish twofish_decrypt: ctx length: 16 dst: cleartext src: ciphertext.

			'aaaaaaaabbbbbbbb' asByteArray = cleartext
		]
	]
]