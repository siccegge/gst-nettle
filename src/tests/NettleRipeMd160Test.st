TestCase subclass: NettleRipeMd160Test [
	testRipemd160Init [
		| ctx |

		self should: [
			ctx := NettleRipeMd160Ctx new.
			NettleRipeMd160 ripemd160_init: ctx.
			true.
		]
	]

	testRipeMd160EmptyDigest [
		| ctx |

		ctx := NettleRipeMd160Ctx new.
		NettleRipeMd160 ripemd160_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleRipeMd160 ripemd160_digest: ctx length: 20 digest: digest.
			digest = #[156 17 133 165 197 233 252 84 97 40 8 151 126 232 245 72 178 37 141 49]
		]
	]

	testRipeMd160ShortInput [
		| ctx |

		ctx := NettleRipeMd160Ctx new.
		NettleRipeMd160 ripemd160_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleRipeMd160 ripemd160_update: ctx length: 5 data: ('Hallo' asByteArray).

			NettleRipeMd160 ripemd160_digest: ctx length: 20 digest: digest.
			digest = #[110 110 79 175 45 171 20 240 43 116 67 239 99 32 161 69 187 84 59 204]
		]
	]

	testRipeMd160LongInputOneUpdate [
		| ctx |

		ctx := NettleRipeMd160Ctx new.
		NettleRipeMd160 ripemd160_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleRipeMd160 ripemd160_update: ctx length: 46 data: ('On 16 November 1797, Goethe slept in Erlangen.' asByteArray).

			NettleRipeMd160 ripemd160_digest: ctx length: 20 digest: digest.
			digest = #[185 221 179 112 26 0 227 211 70 81 5 137 156 54 50 212 235 34 244 3]
		]
	]

	testRipeMd160LongInputTwoUpdates [
		| ctx |

		ctx := NettleRipeMd160Ctx new.
		NettleRipeMd160 ripemd160_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleRipeMd160 ripemd160_update: ctx length: 21 data: ('On 16 November 1797, ' asByteArray).
			NettleRipeMd160 ripemd160_update: ctx length: 25 data: ('Goethe slept in Erlangen.' asByteArray).

			NettleRipeMd160 ripemd160_digest: ctx length: 20 digest: digest.
			digest = #[185 221 179 112 26 0 227 211 70 81 5 137 156 54 50 212 235 34 244 3]
		]
	]
]