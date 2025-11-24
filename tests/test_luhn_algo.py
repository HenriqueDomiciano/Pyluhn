from pyluhn import pyluhn 


def validate_luhn(): 
    digit = pyluhn.Luhn.random_number(12)
    assert(digit.verify() == True)

class TestLuhnAlgo:
    
    def test_true_verification(self):
        entry = 17893729974
        luhn_object = pyluhn.Luhn(digit = entry)
        result = luhn_object.verify()
        assert(result ==True)
    
    def test_false_verification(self):
        entry = 17893729975
        luhn_object = pyluhn.Luhn(digit = entry)
        result = luhn_object.verify()
        assert(result ==False)
    
    def test_random_number(self):
        digit = pyluhn.Luhn.random_number(17)
        print(digit)
        assert(digit.verify() == True)

    def test_random_number_validation(self,benchmark):
        benchmark.pedantic(validate_luhn, warmup_rounds=10, iterations=10, rounds=1000)

