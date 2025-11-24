from libc.stdlib cimport rand

cdef class Luhn:
    cdef public unsigned long long digit

    def __init__(self,unsigned long long  digit):
        self.digit = digit
            
    def verify(self)->bool:
        """
        Verify if digit is an valid Luhn number
        """
        cdef int verification = <int>(self.digit%10)
        cdef unsigned long long digit_c = self.digit//10
        true = Luhn.calculate_luhn_number(digit_c)
        return true==verification   

    @staticmethod
    cdef int calculate_luhn_number(unsigned long long number):
        cdef int total = 0 
        cdef int digit
        cdef bint alt = 1
        while number > 0:
            digit = number %10 
            number //=10
            if alt: 
                digit *= 2
                if digit > 9:
                    digit -=9
            total += digit
            alt = not alt
        return (10 - (total % 10)) % 10
    
    @classmethod
    def random_number(cls,int number_size)->"Luhn":
        cdef int b  = int(number_size)
        cdef int i = 0
        final_result = 0 
        result = '' 
        while i<b:
            result += str(rand()%10)
            i+=1
        final_result = int(result)
        verification = Luhn.calculate_luhn_number(final_result)
        digits  = 10 * final_result + verification
        return cls(digits)
    
        
    