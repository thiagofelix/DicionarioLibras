# Makefile
# Gap Tech Dictionary Build System
#

###########################
export DICT_DEV_KIT_OBJ_DIR = ./objects
###########################

# Generate data.json
data.json: signals.json
	jq '{entries: . | map({ entry: . })}' signals.json > data.json

# Generate data.xml
data.xml: data.json
	json2xml -o data.xml -i data.json

# Generate dictionary xml
dictionary.xml: data.xml
	xsltproc DicionarioLibras.xsl data.xml > dictionary.xml

# Compile dictionary file
./objects/DicionarioLibras.dictionary: dictionary.xml
	./DictionaryDevelopmentKit/bin/build_dict.sh DicionarioLibras dictionary.xml dictionary.css DicionarioLibrasInfo.plist
	echo "Done."

# Delete dictionary
clean:
	rm -rf {./objects,dicionario.xml,data.json,data.xml,dictionary.xml}

# Clean System cache
cache:
	rm -rf ~/Library/Preferences/com.apple.DictionaryServices.plist
	rm -rf ~/Library/Preferences/com.apple.Dictionary.plist
	rm -rf ~/Library/Caches/com.apple.DictionaryApp
	rm -rf ~/Library/Caches/com.apple.DictionaryManager
	rm -rf ~/Library/Caches/com.apple.Dictionary
	rm -rf ~/Library/Caches/com.apple.DictionaryServices

# Install the Dictionary on the System
install: ./objects/DicionarioLibras.dictionary cache
	echo "Installing into ~/Library/Dictionaries".
	mkdir -p ~/Library/Dictionaries
	ditto --noextattr --norsrc ./objects/DicionarioLibras.dictionary	~/Library/Dictionaries/DicionarioLibras.dictionary
	touch ~/Library/Dictionaries
	echo "Done."
	echo "To test the new dictionary, try Dictionary.app."
	echo "Make sure the 'DicionarioLibras' dictionary is enabled on Dictionary.app->Preferences"
