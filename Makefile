# Makefile
# Gap Tech Dictionary Build System
#

###########################
export DICT_DEV_KIT_OBJ_DIR = ./objects
###########################

# Generate data.json
data.json: signals.json
	cat signals.json | jq '{entries: . | map({ entry: . })}' > data.json

# Generate data.xml
data.xml: data.json
	json2xml -o data.xml -i data.json
	echo '<?xml version="1.0" encoding="utf-8"?>' | cat - data.xml > /tmp/out && mv /tmp/out data.xml

# Generate dictionary xml
dictionary.xml: data.xml
	xsltproc DicionarioLibras.xsl data.xml | xmllint --format - > dictionary.xml

# Compile dictionary file
./objects/Libras.dictionary: dictionary.xml
	./DictionaryDevelopmentKit/bin/build_dict.sh Libras dictionary.xml dictionary.css DicionarioLibrasInfo.plist
	echo "Done."

# Delete dictionary
clean:
	rm -rf {./objects,data.json,data.xml,dictionary.xml,Libras.dictionary}

# Clean System cache
cache:
	rm -rf ~/Library/Preferences/com.apple.DictionaryServices.plist
	rm -rf ~/Library/Preferences/com.apple.Dictionary.plist
	rm -rf ~/Library/Caches/com.apple.DictionaryApp
	rm -rf ~/Library/Caches/com.apple.DictionaryManager
	rm -rf ~/Library/Caches/com.apple.Dictionary
	rm -rf ~/Library/Caches/com.apple.DictionaryServices

Libras.dictionary: ./objects/Libras.dictionary
	echo "Creating Libras.dictionary".
	ditto --noextattr --norsrc ./objects/Libras.dictionary	Libras.dictionary

# Install the Dictionary on the System
install: Libras.dictionary cache
	echo "Installing into ~/Library/Dictionaries".
	mkdir -p ~/Library/Dictionaries
	cp -r Libras.dictionary	~/Library/Dictionaries/Libras.dictionary
	touch ~/Library/Dictionaries
	echo "Done."
	echo "To test the new dictionary, try Dictionary.app."
	echo "Make sure the 'Libras' dictionary is enabled on Dictionary.app->Preferences"
