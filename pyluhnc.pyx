from libc.stdlib cimport rand
class Luhn:
    
    def __init__(self,digit,verification = None):
        self.digit = str(digit)
        if verification == None:
            self.verification = self.true_ver = self.calculate_numb()
        else:
            self.verification = str(verification)
            self.true_ver = self.calculate_numb()
            if self.true_ver != self.verification:
                self.verification = self.true_ver

    
    # defining casting variables with python 
    def __int__(self):
        return int(str(self.digit)+str(self.verification))
    
    def __str__(self):
        return str(self.digit)+str(self.verification)

    def __eq__(self,other):
        return self.digit == other.digit and self.verification==other.verification
    
    # defining operators with luhn 
    
    def __add__(self,other):
        result = int(self.digit)+int(other.digit)
        return Luhn(result)
    def __sub__(self,other):
        result = int(self.digit)+int(other.digit)
        if result<=0:
            raise ValueError('Subtraction of Numbers must be non negative')
        else:
            return Luhn(result)
    def __mul__(self,other):
        result = int(self.digit)*int(other.digit)
        return Luhn(result)
            
    def verify(self):
        digit = int(self.digit)
        cdef int verification = digit%10
        cdef int digit_c = digit/10
        true = self.calculate_numb_dir(str(digit_c))
        return true==verification
    
    @classmethod
    def verify_cls(cls,digit):
        digit = int(digit) 
        cdef int verification = digit%10
        cdef int digit_c = digit/10
        true = cls.calculate_numb_dir(str(digit_c))
        return true == verification        
    
    @classmethod
    def calculate_numb_dir(cls,digit):
        cdef int soma = 0 
        cdef int parc = 0 
        cdef int size = len(str(digit))
        digitos  = digit
        cdef int i = 0 
        while i<size:
            if i % 2 == 0 :
                soma +=  int(digitos[i])
            else:
                parc = 2* int(digitos[i])
                if parc>9:
                    soma= soma+ (parc-9)
                else:
                    soma= soma + parc
            i+=1
        return (10 - (soma%10))%10
    
    
    def calculate_numb(self):
        cdef int j = 0 
        cdef int soma = 0 
        cdef int parc = 0 
        cdef int size = len(self.digit)
        digitos = self.digit
        cdef int i = 0 
        while i<size:
            if i % 2 == 0 :
                soma += int(digitos[i])
            else:
                parc = 2 * int(digitos[i])
                if parc>9:
                    soma+=parc-9
                else:
                    soma+=parc
            i+=1
        return (10 - (soma%10))%10
    
    @classmethod
    def random_number(cls,number):
        cdef int b  = int(number)
        cdef int i = 0
        result = '' 
        while i<b:
            result += str(rand()%10)
            i+=1
        verification = cls.calculate_numb_dir(result)
        return Luhn(number,verification)
    
        
    