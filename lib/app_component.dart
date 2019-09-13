import 'package:angular/angular.dart';

import 'src/tvm/tvm_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    TVMComponent    
  ]
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
