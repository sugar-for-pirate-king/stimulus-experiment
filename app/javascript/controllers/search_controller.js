import { Controller } from 'stimulus'

export default class SearchController extends Controller {
  static targets = ["query", "form"]

  call(){
    this.formTarget.submit()
  }

  get query(){
    return this.queryTarget.value
  }
}