How to run
1. source sourceme.csh
2. mentor
3. make > log
4. Verify there are no errors in log.
5. cd sims/riscv_tests/regtest/
6. vsim -do run.do

How to run tests
-- make regtest TEST_NAME=DESIRED_DO_FILEE TEST_ARGS=DESIRED_TEST_ARGS

e.g., make regtest TEST_NAME=riscv_single TEST_ARGS="riscv-tests lui"

or

-- make unit_test TEST_NAME=DESIRED_DO_FILE TEST_ARGS=DESIRED_TEST

Example:
make regtest TEST_NAME=riscv_single TEST_ARGS="OSU euclid2"

caveat:  can also run to enable no GUI

make regtest TEST_NAME=riscv_single TEST_ARGS="OSU euclid2" VSIM_ARGS="-c"

How to add a schematic

1.) Run a test using make regtest
2.) In transcript window, type: add schematic -full sim:/riscv_tb/dut/riscv

(Note: this will not work if you place "add schematic" command within DO file)