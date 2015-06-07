object AdvertisingAgency {

  def numberOfRejections(requests : Array[Int]):Int = {
    requests.length - requests.distinct.length
  }
}
