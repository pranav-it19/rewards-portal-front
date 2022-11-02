part of 'create_praise_cubit.dart';

abstract class CreatePraiseState {}

class FormInitial extends CreatePraiseState {}

class TriggerFormSubmit extends CreatePraiseState {}

class SubmittingForm extends CreatePraiseState {}

class FormSubmitSuccess extends CreatePraiseState {}