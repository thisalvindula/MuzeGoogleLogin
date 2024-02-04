import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muze/app/data/models/api_response.dart';
import 'package:muze/core/locator/locator.dart';
import 'package:muze/modules/auth/app/cubits/auth_cubit.dart';
import 'package:muze/modules/preferences/data/dtos/pagination_dto.dart';
import 'package:muze/modules/social/app/cubits/social_state.dart';
import 'package:muze/modules/social/data/dtos/likes_dto.dart';
import 'package:muze/modules/social/data/dtos/social_dto.dart';
import 'package:muze/modules/social/repositories/social_domain_repository.dart';

class SocialCubit extends Cubit<SocialState> {
  final SocialDomainRepository socialDomainRepository;
  SocialCubit({required this.socialDomainRepository}) : super(const SocialState());

  // POSTS
  Future<void> getPosts({required String page}) async {
    APIResponse response = await socialDomainRepository.getPosts(token: locator<AuthCubit>().state.token, page: page);

    if (response.data == null) {
      return;
    }

    PaginationDto pagination = PaginationDto.fromJson(response.data!["pagination"]);

    log("to : ${pagination.to}");
    log("total : ${pagination.total}");

    if (state.isSuggestion) {
      if (pagination.to == pagination.total) {
        changeHasMore(false);
      } else {
        changeHasMore(true);
      }
    }

    List<PostDto> posts = [];

    for (var post in response.data!["content"] as List) {
      PostDto postDto = PostDto.fromJson(post);
      if (postDto.is_suggestion!) {
        changeSuggestion(true);
      } else {
        changeSuggestion(false);
      }
      posts.add(postDto);
    }

    addPosts(posts);
  }

  void addPosts(List<PostDto> newPosts) {
    List<PostDto> posts = List.from(state.posts);
    posts.addAll(newPosts);
    emit(state.copyWith(posts: posts));
  }

  void clearPosts() {
    emit(state.copyWith(posts: []));
  }

  // LIKES
  Future<bool> likePost({required String postId, required bool liked}) async {
    APIResponse response = await socialDomainRepository.likePost(token: locator<AuthCubit>().state.token, postId: postId, liked: liked);

    return response.success ?? false;
  }

  Future<void> getLikes({required String postId, required String page}) async {
    APIResponse response = await socialDomainRepository.getLikes(token: locator<AuthCubit>().state.token, postId: postId, page: page);

    LikesDto? likes = response.data != null ? LikesDto.fromJson(response.data!) : null;

    likes != null ? addLikes(likes) : null;
  }

  void addLikes(LikesDto newLikes) {
    LikesDto likes = LikesDto(content: []);
    state.likes != null ? likes.content!.addAll(state.likes!.content!) : null;
    likes.content!.addAll(newLikes.content!);
    emit(state.copyWith(likes: likes));
  }

  void clearLikes() {
    emit(state.copyWith(likes: null));
  }

  // PLAYING
  void changePlaying(bool playing) {
    emit(state.copyWith(playing: playing));
  }

  // INDEX
  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  // PAGE
  void increasePage() {
    emit(state.copyWith(page: state.page + 1));
  }

  void resetPage() {
    emit(state.copyWith(page: 1));
  }

  // HAS MORE
  void changeHasMore(bool hasMore) {
    emit(state.copyWith(hasMore: hasMore));
  }

  // SUGGESTIONS
  void changeSuggestion(bool isSuggestion) {
    emit(state.copyWith(isSuggestion: isSuggestion));
  }

  // USER
  Future<bool> followUser({required String userId, required bool follow}) async {
    APIResponse response = await socialDomainRepository.followUser(token: locator<AuthCubit>().state.token, userId: userId, follow: follow);

    return response.success!;
  }
}
