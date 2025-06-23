// To parse this JSON data, do
//
//     final editError = editErrorFromJson(jsonString);

import 'dart:convert';

EditError editErrorFromJson(String str) => EditError.fromJson(json.decode(str));

String editErrorToJson(EditError data) => json.encode(data.toJson());

class EditError {
    String? message;
    Errors? errors;

    EditError({
        this.message,
        this.errors,
    });

    factory EditError.fromJson(Map<String, dynamic> json) => EditError(
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors?.toJson(),
    };
}

class Errors {
    List<String>? name;

    Errors({
        this.name,
    });

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        name: json["name"] == null ? [] : List<String>.from(json["name"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? [] : List<dynamic>.from(name!.map((x) => x)),
    };
}
