OBJ_DIR		= obj

all: all.done

OBJ_V = $(V:%.v=$(OBJ_DIR)/%.obj)
OBJ_SV = $(SV:%.sv=$(OBJ_DIR)/%.obj)

VLIB	= vlib
VLOG	= vlog $(VLOG_OPTS) -work $(LIB_NAME)

TOUCH	= touch -d "`date`"


CUR_DIR = $(shell pwd)

$(OBJ_DIR)/%.obj: %.sv
	@echo "Compiling $<"
	@$(VLOG) $<
	@$(TOUCH) $@

$(OBJ_DIR)/%.obj: %.v
	@echo "Compiling $<"
	@$(VLOG) $<
	@$(TOUCH) $@


$(LIB_NAME):
	vlib $(LIB_NAME)

$(OBJ_DIR):
	mkdir obj

all.done : $(LIB_NAME) $(OBJ_DIR) $(OBJ_SV) $(OBJ_V)
	@$(TOUCH) $@

clean:
	rm -rf *~ all.done obj $(LIB_NAME)

