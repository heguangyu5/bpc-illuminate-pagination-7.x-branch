libilluminate-pagination.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Illuminate libilluminate-pagination

libilluminate-pagination:
	bpc -v \
		-c bpc.conf  \
		-l illuminate-pagination \
		-u illuminate-contracts \
		-u illuminate-support   \
		--input-file src.list

install-libilluminate-pagination:
	cd Illuminate && bpc -l illuminate-pagination --install
