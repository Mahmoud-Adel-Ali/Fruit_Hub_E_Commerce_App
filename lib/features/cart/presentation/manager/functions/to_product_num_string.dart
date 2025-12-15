String toProductNumString(int numOfProducts) {
  if (numOfProducts <= 0) {
    return "سلة التسوق فارغة";
  }

  if (numOfProducts == 1) {
    return "لديك منتج واحد في سلة التسوق";
  }

  if (numOfProducts == 2) {
    return "لديك منتجان في سلة التسوق";
  }

  if (numOfProducts >= 3 && numOfProducts <= 10) {
    return "لديك $numOfProducts منتجات في سلة التسوق";
  }

  return "لديك $numOfProducts منتجًا في سلة التسوق";
}
