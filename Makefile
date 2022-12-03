ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

all: procLocal preFix class jar done

eclipse: procLocal preFix

# Hard compile with th existing java file
hard: class jar done

procLocal:
	processing-java --sketch="$(ROOT_DIR)" --output="$(ROOT_DIR)/build/processing" --force --build

# Processing java preprocesor fix
preFix:
	cd build; sed -i -e "s/.* size commented out by preprocessor .*;/size(1000, 1000);/" processing/source/CardGame.java

# First compile with processing
class:
	cd build; javac -target 1.8 -source 1.8 -d out -cp lib/gifAnimation.jar:buildlib/sound.jar:lib/javamp3-1.0.4.jar:lib/1.8/core.jar:lib/jogl-all.jar processing/source/CardGame.java

# Then compile with javac
jar:
	cd build; jar -cvfm Main.jar ./META-INF/MANIFEST.MF -C ./out . ../data lib

done:
	@echo "Done building"
	@echo "Main.jar located in build directory"
