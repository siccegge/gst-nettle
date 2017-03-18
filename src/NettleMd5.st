DLD addLibrary: 'libnettle.so.4'.

CStruct subclass: NettleMd5Ctx [
	<declaration: #(
		(#state (#array #uInt 4))
		(#count_low #uLong)
		(#count_high #uLong)
		(#block (#array #uChar 64))
		(#index #uLong)
	)>
]

Object subclass: NettleMd5 [
	<category: 'Nettle-C MD5 interface'>

	NettleMd5 class >> md5_init: ctx [
		<cCall: 'nettle_md5_init'
				returning: #void
				args: #(#cObject)>
	]

	NettleMd5 class >> md5_update: ctx length: length data: data [
		<cCall: 'nettle_md5_update'
				returning: #void
				args: #(#cObject #uInt #byteArray)>
	]

	NettleMd5 class >> md5_digest: ctx length: length digest: digest [
		<cCall: 'nettle_md5_digest'
				returning: #void
				args: #(#cObject #uInt #cObject)>
	]
]