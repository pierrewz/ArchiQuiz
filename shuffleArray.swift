func shuffleArray<T>(array: Array<T>) -> Array<T>
{
  for var index = array.count - 1; index > 0; index--
  {
    // Random int from 0 to index-1
    var j = Int(arc4random_uniform(UInt32(index-1)))
 
    // Swap two array elements
    // Notice '&' required as swap uses 'inout' parameters
    swap(&array[index], &array[j])
  }
  return array
}
