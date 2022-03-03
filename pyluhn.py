from random import randint

class Luhn:
    
    def __init__(self,digit,verification = None):
        self.digit = digit
        if verification == None:
            self.verification = self.true_ver = self.calculate_numb()
        else:
            self.verification = verification
            self.true_ver = self.calculate_numb()
            if self.true_ver != self.verification:
                self.verification = self.true_ver

    
    # defining casting variables with python 
    def __int__(self):
        return int(str(self.digit)+str(self.verification))
    
    def __str__(self):
        return str(self.digit)+str(self.verification)
                
    def __repr__(self):
        return f'{str(self.digit) + str(self.true_ver)} ver : {self.true_ver} '
    
    
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
        verification = int(str(self.digit)[-1])
        digit = str(self.digit)[:len(str(self.digit))-1]
        true = self.calculate_numb_dir(digit)
        return true == verification
    
    @classmethod
    def verify_cls(cls,digit):
        verification = int(str(digit)[-1])
        digit = str(digit)[:len(str(digit))-1]
        true = cls.calculate_numb_dir(digit)
        return true == verification        
    
    @classmethod
    def calculate_numb_dir(cls,digit):
        soma,parc = 0,0 
        digitos  = [int(i) for i in list(str(digit))]
        for i,digi in enumerate(digitos):
            if (len(digitos)-i) % 2 == 0 :
                soma += digi
            else:
                parc = 2* digi
                if parc>9:
                    soma+=parc-9
                else:
                    soma+=parc
        return (10 - (soma%10))%10
    
    
    def calculate_numb(self):
        soma,parc = 0,0 
        digitos  = [int(i) for i in list(str(self.digit))]
        for i,digi in enumerate(digitos):
            if (len(digitos) - i) % 2 == 0 :
                soma += digi
            else:
                parc = 2* digi
                if parc>9:
                    soma+=parc-9
                else:
                    soma+=parc
        print(soma)
        return (10 - (soma%10))%10
    @classmethod
    def random_number(cls,number):
        number = random.randint(10**number,(10**number+1)-1)
        verification = cls.calculate_numb_dir(number)
        return Luhn(number,verification)
    
        
    