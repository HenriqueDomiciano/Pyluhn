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
        return verification == Luhn.calculate_luhn_number(digit_c)

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
        cdef unsigned long long final_result = 0 
        cdef int verification 
        cdef unsigned long long final_number   
        for _ in range(number_size - 1):
            final_result = final_result * 10 + rand()%10
        verification = Luhn.calculate_luhn_number(final_result)
        final_number  = 10 * final_result + verification
        return cls(final_number)
    
        
    