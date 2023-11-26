import Foundation


open class State { }
protocol ActionProtocol {
    associatedtype StateType: State
}
open class Action<S: State>: ActionProtocol {
    typealias StateType = S
}




open class ScreenState: State { }
protocol ScreenActionProtocol: ActionProtocol
where StateType: ScreenState { }
open class ScreenAction<S: ScreenState>: Action<S>, ScreenActionProtocol { }

class LoginScreenState : ScreenState {}
class LoginScreenAction : ScreenAction<LoginScreenState>{ }

class HomeScreenState : ScreenState {}
class HomeScreenAction : ScreenAction<HomeScreenState>{ }




open class ModalState: State { }
protocol ModalActionProtocol: ActionProtocol
    where StateType: ModalState { }
open class ModalAction<S: ModalState>: Action<S>, ModalActionProtocol { }


class DialogState : ModalState {}
class DialogAction : ModalAction<DialogState>{ }

class BottomsheetState : ModalState {}
class BotteomsheetAction : ModalAction<BottomsheetState>{ }




let data: [any ActionProtocol] = [
    LoginScreenAction(),
    HomeScreenAction(),
    DialogAction(),
    BotteomsheetAction(),
]

data.forEach { value in
    print(type(of: value))
    print(value as? any ActionProtocol != nil)
    print(value as? any ScreenActionProtocol != nil)
    print(value as? any ModalActionProtocol != nil)
}
