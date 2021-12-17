const radixSort = (list) => {
  const count = maxDigits(list);
  let sorted = stringify(list);

  for(let i = 0; i < count; ++i) {
    sorted = bucketize(sorted, count - 1 - i).flat();
  }

  return sorted.map(x => parseInt(x));
};

const bucketize = (list, position) => {
  return [...Array(10).keys()].map( i => list.filter(x => x.charAt(position) == i));
};

const stringify = (list) => {
  const length = maxDigits(list)

  return list.map(number => {
    const prefix = '0'.repeat(length - String(number).length);

    return `${prefix}${number}`;
  });
};

const maxDigits = (list) => {
  const max = list.reduce((x, y) => Math.max(x, y), list[0]);
  return String(max).length;
};

const unitTest = () => {
  const testCases = [
    [
      [170, 45, 75, 90, 2, 802, 2, 66],
      [2, 2, 45, 66, 75, 90, 170, 802]
    ],
    [
      [8902, 67_832, 12, 1000, 4_002],
      [12, 1000, 4_002, 8902, 67_832]
    ]
  ];

  testCases.forEach(testCase => {
    const [originalArray, expectedResult] = testCase;
    const result = radixSort(originalArray);

    const equal = JSON.stringify(result) == JSON.stringify(expectedResult);

    console.log(equal ? 'Worked well for' : 'Failed on');
    console.log(originalArray);
    console.log(result);
    console.log('--------')
  });
}

unitTest();
