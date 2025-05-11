vsim work.test_sum
add wave -divider "Inputs"
add wave Ain
add wave Bin
add wave Ci

add wave -divider "My Sum"
add wave res_my
add wave Co_my

add wave -divider "Reference Sum"
add wave res_ref
add wave Co_ref

run 200ns

