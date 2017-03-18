DLD addLibrary: 'libnettle.so.4'.

CStruct subclass: NettleSha1Ctx [
	<declaration: #(
		(#state (#array #uInt 5))
		(#count_low #uLong)
		(#count_high #uLong)
		(#block (#array #uChar 64))
		(#index #uLong)
	)>
]

Object subclass: NettleSha1 [
	<category: 'Nettle-C SHA1 interface'>

	NettleSha1 class >> sha1_init: ctx [
		<cCall: 'nettle_sha1_init'
				returning: #void
				args: #(#cObject)>
	]

	NettleSha1 class >> sha1_update: ctx length: length data: data [
		<cCall: 'nettle_sha1_update'
				returning: #void
				args: #(#cObject #uInt #byteArray)>
	]

	NettleSha1 class >> sha1_digest: ctx length: length digest: digest [
		<cCall: 'nettle_sha1_digest'
				returning: #void
				args: #(#cObject #uInt #cObject)>
	]
]