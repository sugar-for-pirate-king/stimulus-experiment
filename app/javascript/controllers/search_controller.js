import Rails from '@rails/ujs';
import { Controller } from 'stimulus'

export default class SearchController extends Controller {
  static targets = ["query", "form"]

  call(){
    Rails.fire(this.formTarget, 'submit')
  }

  get query(){
    return this.queryTarget.value
  }
}