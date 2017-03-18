TestCase subclass: NettleMd5Test [
	testMd5Init [
		| ctx |

		self should: [
			ctx := NettleMd5Ctx new.
			NettleMd5 md5_init: ctx.
			true.
		]
	]

	testMd5EmptyDigest [
		| ctx |

		ctx := NettleMd5Ctx new.
		NettleMd5 md5_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaa' asByteArray.

			NettleMd5 md5_digest: ctx length: 16 digest: digest.
			digest = #[212 29 140 217 143 0 178 4 233 128 9 152 236 248 66 126]
		]
	]

	testMd5ShortInput [
		| ctx |

		ctx := NettleMd5Ctx new.
		NettleMd5 md5_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaa' asByteArray.

			NettleMd5 md5_update: ctx length: 5 data: ('Hallo' asByteArray).

			NettleMd5 md5_digest: ctx length: 16 digest: digest.
			digest = #[209 191 147 41 157 225 182 142 109 56 44 137 59 241 33 95]
		]
	]

	testMd5LongInputOneUpdate [
		| ctx |

		ctx := NettleMd5Ctx new.
		NettleMd5 md5_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaa' asByteArray.

			NettleMd5 md5_update: ctx length: 46 data: ('On 16 November 1797, Goethe slept in Erlangen.' asByteArray).

			NettleMd5 md5_digest: ctx length: 16 digest: digest.
			digest = #[13 106 30 108 39 236 75 210 44 100 102 129 228 122 59 207]
		]
	]

	testMd5LongInputTwoUpdates [
		| ctx |

		ctx := NettleMd5Ctx new.
		NettleMd5 md5_init: ctx.

		self should: [
			| digest |
			digest := 'bbaaaaaaaaaaaaaa' asByteArray.

			NettleMd5 md5_update: ctx length: 21 data: ('On 16 November 1797, ' asByteArray).
			NettleMd5 md5_update: ctx length: 25 data: ('Goethe slept in Erlangen.' asByteArray).

			NettleMd5 md5_digest: ctx length: 16 digest: digest.
			digest = #[13 106 30 108 39 236 75 210 44 100 102 129 228 122 59 207]
		]
	]
]