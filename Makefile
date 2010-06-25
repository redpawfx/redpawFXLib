#//////////////////////////////////////////////////////////////////////////////////
#//// GENERIC  maya plugin make file
#///////////////////////////////////////////////////

#////////
#/// version 1.0
#/// author : 
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

#
# Include platform specific build settings
#
include ./buildconfig

.SUFFIXES: .cpp .cc .o .so .c .bundle 

OUTPUT = ./

PLUGIN = pluginName.$(EXT)

COMPILE  = $(CC) -c $(CFLAGS) $(INCLUDES) 

.cpp.o:
	$(COMPILE) $< -o $@

plugins: $(PLUGIN)

depend:
	makedepend $(INCLUDES) *.cc *.cpp

clean:
	-rm -f *.o  $(OUTPUT)*.so


##################
# Specific Rules #
##################

SOURCES = pluginMain.cpp secondSourceFile.cpp  thirdSourcefile.cpp  etc  etc etc  \
		 
OBJS = $(SOURCES:.cpp=.o)  

all: $(SOURCES) $(PLUGIN)

$(PLUGIN): $(OBJS)
	-rm -f $(OUTPUT)$@
	$(LD) -o $(OUTPUT)$@ $(OBJS) $(LIBS) 







