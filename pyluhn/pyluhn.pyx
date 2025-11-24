from libc.stdlib cimport rand

class Luhn:
    def __init__(self,digit):
        self.digit = digit
            
    def verify(self)->bool:
        """
        Verify if digit is an valid Luhn number
        """
        cdef int verification = self.digit%10
        cdef unsigned long long digit_c = self.digit/10
        true = Luhn.calculate_luhn_number(digit_c)
        return true==verification   

    @staticmethod
    def calculate_luhn_number(number:int)->int:
        cdef int soma = 0 
        cdef int parc = 0 
        cdef int size = len(str(number))
        digits  = str(number)
        cdef int i = 0 
        while i<size:
            if i % 2 == 0 :
                soma +=  int(digits[i])
            else:
                parc = 2* int(digits[i])
                if parc>9:
                    soma= soma+ (parc-9)
                else:
                    soma= soma + parc
            i+=1
        return (10 - (soma%10))%10
    
    @classmethod
    def random_number(cls,number_size:int)->"Luhn":
        cdef int b  = int(number_size)
        cdef int i = 0
        final_result = 0 
        result = '' 
        while i<b:
            result += str(rand()%10)
            i+=1
        final_result = int(result)
        verification = Luhn.calculate_luhn_number(final_result)
        digits  = int(str(final_result) + str(verification))
        return cls(digits)
    
        
    