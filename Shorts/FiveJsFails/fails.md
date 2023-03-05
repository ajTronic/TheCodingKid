# The Top 5 JavaScript Fails
---------------

## Number 5: Funny Math
```js
10000000000000000 + 5 // -> 10000000000000004
```

## Number 4: ```Number.MIN_VALUE``` is not what you think
```js
Number.MIN_VALUE > 0; // -> true

Number.MIN_VALUE == 0; // -> false

Number.MIN_VALUE >= 0; // -> true
```

## Number 3: Decimal Addition
```js
0.1 + 0.2 == 0.3 // -> false
```

```js
0.1 + 0.2 // -> 0.30000000000000004
```

## Number 2: Banana!
```js
('b'+'a'+ +'b'+'a').toLowerCase() // -> 'banana'
```

## Number 1: Fail
```js
(![] + [])[+[]] +
  (![] + [])[+!+[]] +
  ([![]] + [][[]])[+!+[] + [+[]]] +
  (![] + [])[!+[] + !+[]] // -> 'fail'
```