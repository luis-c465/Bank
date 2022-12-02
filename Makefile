ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

no:
	@echo ""

all: procLocal preFix class jar done

# Hard compile with th existing java file
hard: class jar done

# First compile with processing
class:
	cd build; javac -target 1.8 -source 1.8 -d out -cp lib/gifAnimation.jar:buildlib/sound.jar:lib/javamp3-1.0.4.jar:lib/1.8/core.jar:lib/jogl-all.jar processing/source/CardGame.java

# Then compile with javac
jar:
	cd build; jar cvfm Main.jar ./META-INF/MANIFEST.MF -C ./out . ../data

done:
	@echo "Done building"
	@echo "Main.jar located in build directory"

# Builds with processing
# proc:
# 	cd /opt/hostedtoolcache/processing/3.5.4/x64; ./processing-java --sketch="$(ROOT_DIR)" --output="$(ROOT_DIR)/build/processing" --force --build

procLocal:
	processing-java --sketch="$(ROOT_DIR)" --output="$(ROOT_DIR)/build/processing" --force --build

# Processing java preprocesor fix
preFix:
	cd build; sed -i -e "s/.* size commented out by preprocessor .*;/size(1000, 1000);/" processing/source/CardGame.java
