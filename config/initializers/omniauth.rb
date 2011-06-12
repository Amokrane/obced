Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, 'PFK5aQ7WM5KrF9PEPiByRg', 'whGdAmyMSyvQgmzLQzHoTQRG8KJkAf6cgbcSIm1pTJw'
	provider :GitHub,  '6f4f4b3ec23f177220fc', 'b20ec7e9976a509a7556188a7be9ab05704e914a'
	provider :BitBucket, 'WehtKKLbnxmcdfxMRK', 'C9z2FhJjQULVJbNXcFgt3qRrs3etdsUj'
end