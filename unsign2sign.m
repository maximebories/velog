function output = unsign2sign(input)
  quant = 2^nextpow2(max(input));
  select = (input > quant/2-1);
  output = (1-select) .* input + select .* (input - quant);
endfunction
