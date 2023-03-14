.PHONY: rename_template
rename_template:
	find . -type f -name '*.ex' -exec sed -i '' s/Phxlite/that/g {} +
	find . -type f -name '*.exs' -exec sed -i '' s/Phxlite/that/g {} +
	mv lib/phxlite.ex lib/
	mv lib/phxlite_web.ex lib/_web.ex
	mv lib/phxlite lib/phxlite
	mv lib/phxlite_web lib/phxlite_web