# HUST-Functional-Programming

# 结课测试


# 1
功能比较：
take函数：
1. take函数接受一个列表和一个整数 i 作为参数，返回列表中前 i 个元素。如果 i 大于列表的长度，它只会返回列表本身。
2. take函数使用递归来逐个提取元素。

rtake函数：
1. rtake函数也接受一个列表、整数 i 和一个累积参数 taken 作为参数，返回一个包含前 i 个元素的逆序列表。与take不同的是，rtake会从列表的尾部开始提取元素。
2. 递归：rtake同样使用递归，但它是尾递归，因为它累积结果在参数 taken 中。

性能比较：

1. take函数：
性能较差：由于take函数是从列表的头部开始提取元素，每次递归调用都会生成新的列表（通过 x::take(xs, i-1)），因此在提取大量元素时，会生成多个中间列表，导致性能较差。
2. rtake函数：
性能较好：rtake函数是尾递归的，它从列表的尾部开始提取元素并将结果累积在参数 taken 中，不会生成中间列表。这使得它在提取大量元素时性能较好。rtake函数在性能上优于take函数，特别是在处理大型列表时

两个函数的 work 均为 O(n)
# 2
```python
nextperm [2,3,1,4]
↓
next [2] [3, 1, 4]
↓
next [3, 2] [1, 4]
↓
swap [3, 2]
↓
3::swap([2])
   ↓
   1::2::4
↓
[3, 1, 2, 4]
```

# 3
```python
fun quickSort([]: int list) : int list = []
  | quickSort(x::xs: int list) =
    let
        fun partition([], less, greater) = (less, greater)
          | partition(y::ys, less, greater) =
            if y < x then
                partition(ys, y::less, greater)
            else
                partition(ys, less, y::greater)
    in
        let
            val (smaller, larger) = partition(xs, [], [])
        in
            quickSort(smaller) @ [x] @ quickSort(larger)
        end
    end;

```
