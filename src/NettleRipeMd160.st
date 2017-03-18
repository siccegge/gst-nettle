DLD addLibrary: 'libnettle.so.4'.

CStruct subclass: NettleRipeMd160Ctx [
	<declaration: #(
		(#state (#array #uInt 5))
		(#count_low #uLong)
		(#count_high #uLong)
		(#block (#array #uChar 64))
		(#index #uLong)
	)>
]

Object subclass: NettleRipeMd160 [
	<category: 'Nettle-C RIPEMD160 interface'>

	NettleRipeMd160 class >> ripemd160_init: ctx [
		<cCall: 'nettle_ripemd160_init'
				returning: #void
				args: #(#cObject)>
	]

	NettleRipeMd160 class >> ripemd160_update: ctx length: length data: data [
		<cCall: 'nettle_ripemd160_update'
				returning: #void
				args: #(#cObject #uInt #byteArray)>
	]

	NettleRipeMd160 class >> ripemd160_digest: ctx length: length digest: digest [
		<cCall: 'nettle_ripemd160_digest'
				returning: #void
				args: #(#cObject #uInt #cObject)>
	]
]