all: class jar done

# First compile with processing
class:
	cd build; javac -target 1.8 -source 1.8 -d out -cp lib/gifAnimation.jar:buildlib/sound.jar:lib/javamp3-1.0.4.jar:lib/1.7/core.jar:lib/jogl-all.jar processing/source/ArithmeticGen.java

# Then compile with javac
jar:
	cd build; jar cvfm Main.jar ./META-INF/MANIFEST.MF -C ./out . ../data

done:
	@echo "Done building"
	@echo "Main.jar located in build directory"
