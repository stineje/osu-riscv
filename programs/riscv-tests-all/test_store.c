// Ross Thompson
// Oklahoma State University
// April 03, 2020

// we need to verify that load and store works for all sizes and alignments

// aligned
char array_1byte [128] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
			  10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
			  20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
			  30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
			  40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
			  50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
			  60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
			  70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
			  80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
			  90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
			  100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
			  110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
			  120, 121, 122, 123, 124, 125, 126, 127};

short int array_2byte [128] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
			       10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
			       20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
			       30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
			       40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
			       50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
			       60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
			       70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
			       80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
			       90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
			       100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
			       110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
			       120, 121, 122, 123, 124, 125, 126, 127};

int array_4byte [128] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
			 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
			 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
			 30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
			 40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
			 50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
			 60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
			 70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
			 80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
			 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
			 100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
			 110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
			 120, 121, 122, 123, 124, 125, 126, 127};

typedef struct array_2byte_offset_1_t {
  char byte0;
  short int array_2byte[128];
} array_2byte_offset_1_t;

typedef struct array_4byte_offset_1_t {
  char byte0;
  int array_4byte[128];
} array_4byte_offset_1_t;

typedef struct array_4byte_offset_2_t {
  char byte0;
  char byte1;  
  int array_4byte[128];
} array_4byte_offset_2_t;

typedef struct array_4byte_offset_3_t {
  char byte0;
  char byte1;
  char byte2;    
  int array_4byte[128];
} array_4byte_offset_3_t;

array_2byte_offset_1_t array_2byte_offset_1;
array_4byte_offset_1_t array_4byte_offset_1;
array_4byte_offset_2_t array_4byte_offset_2;
array_4byte_offset_3_t array_4byte_offset_3;

// offset by 1
// just 2 and 4 bytes

// offset by 2
// just 4 bytes

// offset by 3
// just 4 bytes

int test_store(){

  // we can read from each array.
  int index;
  char value_1byte;
  short int value_2byte;
  short int value_2byte_offset_1;
  int value_4byte;
  int value_4byte_offset_1;
  int value_4byte_offset_2;
  int value_4byte_offset_3;

  // initialize the offset arrays
  for(index = 0; index < 128; index++){
    array_2byte_offset_1.array_2byte[index] = (short int) index;
    array_4byte_offset_1.array_4byte[index] = index;
    array_4byte_offset_2.array_4byte[index] = index;
    array_4byte_offset_3.array_4byte[index] = index;
  }
  

  // check values
  for(index = 0; index < 128; index++){
    value_1byte = array_1byte[index];
    value_2byte = array_2byte[index];
    value_4byte = array_4byte[index];
    value_2byte_offset_1 = array_2byte_offset_1.array_2byte[index];
    value_4byte_offset_1 = array_4byte_offset_1.array_4byte[index];
    value_4byte_offset_2 = array_4byte_offset_2.array_4byte[index];
    value_4byte_offset_3 = array_4byte_offset_3.array_4byte[index];

    if((int)value_1byte != index){
      return 17;
    }
    if((int) value_2byte != index){
      return 17;
    }
    if(value_4byte != index){
      return 17;
    }
    if((int) value_2byte_offset_1 != index){
      return 17;
    }
    if(value_4byte_offset_1 != index){
      return 17;
    }
    if(value_4byte_offset_2 != index){
      return 17;
    }
    if(value_4byte_offset_3 != index){
      return 17;
    }
  }

  // now that the reads are verifies lets write new values to the arrays
  for(index = 0; index < 128; index++){
    array_1byte[index] = 128 - (char) index;
    array_2byte[index] = 128 - (short int) index;
    array_4byte[index] = 128 - index;
    array_2byte_offset_1.array_2byte[index] = 128 - (short int) index;
    array_4byte_offset_1.array_4byte[index] = 128 - index;
    array_4byte_offset_2.array_4byte[index] = 128 - index;
    array_4byte_offset_3.array_4byte[index] = 128 - index;
  }

  // now read them back
  for(index = 127; index >= 0; index--){
    value_1byte = array_1byte[index];
    value_2byte = array_2byte[index];
    value_4byte = array_4byte[index];
    value_2byte_offset_1 = array_2byte_offset_1.array_2byte[index];
    value_4byte_offset_1 = array_4byte_offset_1.array_4byte[index];
    value_4byte_offset_2 = array_4byte_offset_2.array_4byte[index];
    value_4byte_offset_3 = array_4byte_offset_3.array_4byte[index];

    if((int)value_1byte != 128 - index){
      return 17;
    }
    if((int) value_2byte != 128 - index){
      return 17;
    }
    if(value_4byte != 128 - index){
      return 17;
    }
    if((int) value_2byte_offset_1 != 128 - index){
      return 17;
    }
    if(value_4byte_offset_1 != 128 -index){
      return 17;
    }
    if(value_4byte_offset_2 != 128 -index){
      return 17;
    }
    if(value_4byte_offset_3 != 128 -index){
      return 17;
    }
  }

  // passed test
  return 10;
}
