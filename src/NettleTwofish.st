DLD addLibrary: 'libnettle.so.4'.

CStruct subclass: NettleTwofishCtx [
	<declaration: #(
		(#keys (#array #uInt 40))
		(#s_box (#array (#array #uInt 256) 4))
	)>
]

Object subclass: NettleTwofish [
	<category: 'Nettle-C TWOFISH interface'>

	NettleTwofish class >> twofish_set_key: ctx length: length key: key [
		<cCall: 'nettle_twofish_set_key'
				returning: #void
				args: #(#cObject #int #byteArray)>
	]

	NettleTwofish class >> twofish_encrypt: ctx length: length dst: dst src: src [
		<cCall: 'nettle_twofish_encrypt'
				returning: #void
				args: #(#cObject #int #cObject #byteArray)>
	]

	NettleTwofish class >> twofish_decrypt: ctx length: length dst: dst src: src [
		<cCall: 'nettle_twofish_decrypt'
				returning: #void
				args: #(#cObject #int #cObject #byteArray)>
	]
]
