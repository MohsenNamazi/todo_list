import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/model/new_comment/new_comment.dart';
import 'package:todo_list/data/repository/comments_repository.dart';

import '../../mocks/todoist_network_mock.dart';
import '../model/comment.dart';

class NewCommentBodyFake extends Fake implements NewCommentBody {}

void main() {
  late TodoistNetworkMock mockNetwork;
  late CommentsRepository commentsRepository;

  const taskId = '2995104339';
  const commentId = '2992679862';
  const content = 'Need one bottle of milk';

  setUpAll(() {
    registerFallbackValue(NewCommentBodyFake());
  });

  setUp(() {
    mockNetwork = TodoistNetworkMock();
    commentsRepository = CommentsRepository(mockNetwork);
  });

  test('getComments returns a list of comments', () async {
    final comments = [await CommentFake.getData()];

    when(() => mockNetwork.getComments(any()))
        .thenAnswer((_) async => comments);

    final result = await commentsRepository.getComments(taskId);

    expect(result, comments);
    verify(() => mockNetwork.getComments(any())).called(1);
  });

  test('createComment returns the created comment', () async {
    final comment = await CommentFake.getData();
    const newCommentBody = NewCommentBody(content: content);

    when(() => mockNetwork.createComment(
            newCommentBody: any(named: 'newCommentBody')))
        .thenAnswer((_) async => comment);

    final result = await commentsRepository.createComment(body: newCommentBody);

    expect(result, comment);
    verify(() => mockNetwork.createComment(
        newCommentBody: any(named: 'newCommentBody'))).called(1);
  });

  test('getComment returns the comment by id', () async {
    final comment = await CommentFake.getData();

    when(() => mockNetwork.getComment(id: commentId))
        .thenAnswer((_) async => comment);

    final result = await commentsRepository.getComment(id: commentId);

    expect(result, comment);
    verify(() => mockNetwork.getComment(id: commentId)).called(1);
  });

  test('updateComment returns the updated comment', () async {
    final comment = await CommentFake.getData();

    when(() => mockNetwork.updateComment(
        id: commentId,
        content: any(named: 'content'))).thenAnswer((_) async => comment);

    final result =
        await commentsRepository.updateComment(id: commentId, content: content);

    expect(result, comment);
    verify(() => mockNetwork.updateComment(
        id: commentId, content: any(named: 'content'))).called(1);
  });

  test('deleteComment returns true on successful delete', () async {
    when(() => mockNetwork.deleteComment(id: commentId))
        .thenAnswer((_) async => true);

    final result = await commentsRepository.deleteComment(id: commentId);

    expect(result, true);
    verify(() => mockNetwork.deleteComment(id: commentId)).called(1);
  });

  test('deleteComment throws an exception on failed delete', () async {
    when(() => mockNetwork.deleteComment(id: commentId))
        .thenThrow(Exception('Failed to delete'));

    expect(
      () async => await commentsRepository.deleteComment(id: commentId),
      throwsA(isA<Exception>()),
    );
    verify(() => mockNetwork.deleteComment(id: commentId)).called(1);
  });
}
