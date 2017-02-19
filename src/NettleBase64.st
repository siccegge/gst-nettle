DLD addLibrary: 'libnettle.so.4'.

CStruct subclass: NettleBase64EncodeCtx [
	<declaration: #(
		(#word #uInt)
		(#bits #uInt)
	)>
]

Object subclass: NettleBase64Encode [
	<category: 'Nettle-C Base64 interface'>

	NettleBase64Encode class >> base64_encode_length: length [
		((length * 8 + 4)/6)
	]

	NettleBase64Encode class >> base64_encode_raw_length: length [
		(((length + 2)/3)*4)
	]

	NettleBase64Encode class >> base64_encode_init: ctx [
		<cCall: 'nettle_base64_encode_init'
				returning: #void
				args: #(#cObject)>
	]

	NettleBase64Encode class >> base64_encode_single: ctx dst: dst src: src [
		<cCall: 'nettle_base64_encode_single'
				returning: #uInt
				args: #(#cObject #cObject #char)>
	]

	NettleBase64Encode class >> base64_encode_update: ctx dst: dst length: length src: src [
		<cCall: 'nettle_base64_encode_update'
				returning: #uInt
				args: #(#cObject #cObject #uInt #byteArray)>
	]

	NettleBase64Encode class >> base64_encode_final: ctx dst: dst [
		<cCall: 'nettle_base64_encode_final'
				returning: #uInt
				args: #(#cObject #cObject)>
	]

	NettleBase64Encode class >> base64_encode_raw: dst length: length src:src [
		<cCall: 'nettle_base64_encode_raw'
				returning: #void
				args: #(#cObject #uInt #byteArray)>
	]
]

CStruct subclass: NettleBase64DecodeCtx [
	<declaration: #(
		(#word #uInt)
		(#bits #uInt)
		(#padding #uInt)
	)>
]

Object subclass: NettleBase64Decode [
	<category: 'Nettle-C Base64 interface'>

	NettleBase64Decode class >> base64_decode_length: length [
		((length * 8 + 4)/6)
	]

	NettleBase64Decode class >> base64_decode_raw_length: length [
		(((length + 2)/3)*4)
	]

	NettleBase64Decode class >> base64_decode_init: ctx [
		<cCall: 'nettle_base64_decode_init'
				returning: #void
				args: #(#cObject)>
	]

	NettleBase64Decode class >> base64_decode_single: ctx dst: dst src: src [
		<cCall: 'nettle_base64_decode_single'
				returning: #uInt
				args: #(#cObject #cObject #char)>
	]

	NettleBase64Decode class >> base64_decode_update: ctx dstlen: dstlen dst: dst srclen: srclen src: src [
		<cCall: 'nettle_base64_decode_update'
				returning: #uInt
				args: #(#cObject (#ptr #uInt) #cObject #uInt #byteArray)>
	]

	NettleBase64Decode class >> base64_decode_final: ctx [
		<cCall: 'nettle_base64_decode_final'
				returning: #uInt
				args: #(#cObject)>
	]
]
