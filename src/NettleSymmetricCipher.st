DLD addLibrary: 'libnettle.so.6'.

CStruct subclass: NettleSymmetricCipher [
	nettle_encrypt: length dst: dst src: src [
	]

	nettle_decrypt: length dst: dst src: src [
	]
]