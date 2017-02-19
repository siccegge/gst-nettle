DLD addLibrary: 'libnettle.so.4'.

Object subclass: NettleCbc [
	<category: 'Nettle-C CBC interface'>

	NettleCbc class >> cbc_encrypt: ctx func: func blocksize: blocksize iv: iv length: length dst: dst src: src [
		<cCall: 'nettle_cbc_encrypt'
				returning: #void
				args: #(#cObject #cObject #uInt #byteArray #uInt #cObject #byteArray)>
	]

	NettleCbc class >> cbc_decrypt: ctx func: func blocksize: blocksize iv: iv length: length dst: dst src: src [
		<cCall: 'nettle_cbc_decrypt'
				returning: #void
				args: #(#cObject #cObject #uInt #byteArray #uInt #cObject #byteArray)>
	]
]
