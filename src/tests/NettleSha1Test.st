TestCase subclass: NettleSha1Test [
	testSha1Init [
		| ctx |

		self should: [
			ctx_en := NettleSha1Ctx new.
			NettleSha1 sha1_init: ctx.
			true.
		]
	]

	testSha1EmptyDigest [
		| ctx |

		ctx := NettleSha1Ctx new.
		NettleSha1 sha1_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleSha1 sha1_digest: ctx length: 20 digest: digest.
			digest = #[218 57 163 238 94 107 75 13 50 85 191 239 149 96 24 144 175 216 7 9]
		]
	]

	testSha1ShortInput [
		| ctx |

		ctx := NettleSha1Ctx new.
		NettleSha1 sha1_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleSha1 sha1_update: ctx length: 5 data: ('Hallo' asByteArray).

			NettleSha1 sha1_digest: ctx length: 20 digest: digest.
			digest = #[89 217 166 223 6 185 246 16 247 219 142 3 104 150 237 3 102 45 22 143]
		]
	]

	testSha1LongInputOneUpdate [
		| ctx |

		ctx := NettleSha1Ctx new.
		NettleSha1 sha1_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleSha1 sha1_update: ctx length: 46 data: ('On 16 November 1797, Goethe slept in Erlangen.' asByteArray).

			NettleSha1 sha1_digest: ctx length: 20 digest: digest.
			digest = #[246 91 177 89 10 169 104 186 79 147 224 68 152 158 142 142 248 21 159 94]
		]
	]

	testSha1LongInputTwoUpdates [
		| ctx |

		ctx := NettleSha1Ctx new.
		NettleSha1 sha1_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaaaaaa' asByteArray.

			NettleSha1 sha1_update: ctx length: 21 data: ('On 16 November 1797, ' asByteArray).
			NettleSha1 sha1_update: ctx length: 25 data: ('Goethe slept in Erlangen.' asByteArray).

			NettleSha1 sha1_digest: ctx length: 20 digest: digest.
			digest = #[246 91 177 89 10 169 104 186 79 147 224 68 152 158 142 142 248 21 159 94]
		]
	]
]