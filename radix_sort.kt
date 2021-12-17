fun main() = unitTest()

fun radixSort(list: List<Int>): List<Int> {
  val count = maxDigits(list)
  var sorted = stringify(list)

  for(i in 1..count) {
    sorted = bucketize(sorted, count - i).flatten()
  }

  return sorted.map { it.toInt() }
}

fun bucketize(list: List<String>, position: Int): List<List<String>> {
  return (0..9).map {
    list.filter { str -> str[position].toString() == it.toString() }
  }
}

fun stringify(list: List<Int>): List<String> {
  val length = maxDigits(list)

  return list.map {
    val prefix = "0".repeat(length - it.toString().length)

    "$prefix$it"
  }
}

fun maxDigits(list: List<Int>) = list.maxOrNull()?.toString()?.length ?: 0

fun unitTest() {
  val testCases = listOf(
    listOf(
      listOf(170, 45, 75, 90, 2, 802, 2, 66),
      listOf(2, 2, 45, 66, 75, 90, 170, 802)
    ),
    listOf(
      listOf(8902, 67832, 12, 1000, 4002),
      listOf(12, 1000, 4002, 8902, 67832)
    )
  )

  testCases.forEach {
    val originalArray = it[0]
    val expectedResult = it[1]

    val result = radixSort(originalArray)

    if (result == expectedResult) {
      println("Worked well for")
    } else {
      println("Failed on")
    }

    println(originalArray)
    println(result)
    println("--------")
  }
}
