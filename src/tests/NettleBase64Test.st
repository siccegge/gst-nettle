TestCase subclass: NettleBase64Test [
	testBase64EncodeUpdate [
		| ctx buffer1 buffer2 bufferfin |

		ctx := NettleBase64EncodeCtx new.
		NettleBase64Encode base64_encode_init: ctx.

		buffer1 := #[0 0 0 0 0 0 0 0].
		buffer2 := #[0 0 0 0 0 0 0 0].
		bufferfin := #[0 0 0].

		NettleBase64Encode base64_encode_update: ctx dst: buffer1 length: 5 src: 'Hallo' asByteArray.
		NettleBase64Encode base64_encode_update: ctx dst: buffer2 length: 4 src: 'Welt' asByteArray.
		NettleBase64Encode base64_encode_final: ctx dst: bufferfin.

		self should: [ #[83 71 70 115 98 71 0 0] = buffer1. ].
		self should: [ #[57 88 90 87 120 48 0 0] = buffer2. ].
		self should: [ #[0 0 0] = bufferfin. ].
	]

	testBase64EncodeRaw [
		| buffer |

		buffer := #[0 0 0 0 0 0 0 0 0 0 0 0 0 0].

		NettleBase64Encode base64_encode_raw: buffer length: 9 src: 'HalloWelt' asByteArray.

		self should: [ #[83 71 70 115 98 71 57 88 90 87 120 48 0 0] = buffer. ]
	]

	testBase64Decode [
		| ctx src dst dstlen |

		ctx := NettleBase64DecodeCtx new.
		NettleBase64Decode base64_decode_init: ctx.
		src := #[83 71 70 115 98 71 57 88 90 87 120 48].
		dst := #[0 0 0 0 0 0 0 0 0].
		dstlen := CInt gcValue: 9.

		NettleBase64Decode base64_decode_update: ctx dstlen: dstlen dst: dst srclen: 12 src: src.

		self should: [ dst asString = 'HalloWelt'. ].
		self should: [ (NettleBase64Decode base64_decode_final: ctx) = 1. ]
	]
]