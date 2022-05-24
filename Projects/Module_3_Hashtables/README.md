# Explaing why two implementations 


For the Project "Caesar Cipher" in Module 3 - Hash tables

From the Examples
when using a shift of 3 encoding "Xx" will result in different value "xx" when decoding because both X & x are encoded in to a space

yet also from the example
"lower case letters should remain lower case, upper case letters should remain upper case, and all other punctuation should stay as it is"

So first implementation is ignorein the space problem thus
anything than encodes in to a space chanracter will alwasy retrun lower case when decoded 

The secound implementation shifts using swift's UnicodeScalar thus 
lower case letters should remain lower case, upper case letters should remain upper case, and all other punctuation should stay as it is when decoded 

