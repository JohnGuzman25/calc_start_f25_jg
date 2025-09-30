import math
from calculator import calc

def test_add():        assert calc.add(2, 3) == 5
def test_subtract():   assert calc.subtract(10, 4) == 6
def test_multiply():   assert calc.multiply(6, 7) == 42
def test_divide():     assert math.isclose(calc.divide(20, 5), 4.0)
def test_divide_by_zero_raises():
    import pytest
    with pytest.raises(ValueError):
        calc.divide(1, 0)

def test_add_large_numbers():
    from calculator import calc
    assert calc.add(10**6, 10**6) == 2_000_000

def test_multiply_by_zero():
    from calculator import calc
    assert calc.multiply(12345, 0) == 0
